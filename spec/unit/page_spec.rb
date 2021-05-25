require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
include Capybara::DSL
Capybara.app_host = "http://website"
Capybara.run_server = false
Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,
                                           :url => "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}/wd/hub",
                                               :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
                                                     "chromeOptions" => { "args" => [
                                                             '--no-default-browser-check',
                                                                   '--disable-dev-shm'
                                                                       ]}
                                                        )
                                             )
end
Capybara.default_driver = :selenium
describe "Example page renders unit tests" do
    it "Shows explore cali logo" do
          visit('/')
              expect(page.has_selector? 'a.logo').to.be_true
                end
end
