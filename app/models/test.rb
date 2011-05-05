require 'celerity'
class Test < ActiveRecord::Base
  belongs_to :service
  has_many :test_steps
  has_many :test_runs
  has_and_belongs_to_many :watchers, :class_name=>'User'

  def execute 
    browser = Celerity::Browser.new( :log_level => :severe, :resynchronize => true, :css => false, :javascript_enabled=>false)
    test_steps.each do |step|
      case step.action
      when 'goto'
        browser.goto('http://dev-franchise.realiefcenters.com')
      when 'Set Value'
        logger.info browser.elements_by_xpath(step.xpath).first
        elem = browser.elements_by_xpath(step.xpath).first
        if (!elem) 
          raise "unable to find element: #{step.xpath}\n#{browser.xml}"
        end 
        elem.value = step.value
      when 'click'
        elem = browser.elements_by_xpath(step.xpath).first
        elem.click
      when 'expect contains'
        #browser.wait
        elem = browser.elements_by_xpath(step.xpath).first
        output = elem.text.include?(step.value)
        if (!output) ## assertion failed
          browser.close()
          return false
        end
      end
    end
    browser.close()
    true
  end

  def run
    run = TestRun.new(:test=>self, :status=>self.execute)
    run.save  
    unless run.status
      watchers.each do |recipient|
        Notifier.alert(recipient, self).deliver # sends the email
      end
    end
  end

  def status
    test_runs.first.status
  end
end
