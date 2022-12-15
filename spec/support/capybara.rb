def chrome_options(*opts)
  options = Selenium::WebDriver::Chrome::Options.new
  flags = %w[--no-sandbox --disable-dev-shm-usage --ignore-certificate-errors --test-type --window-size=1024,768
             --enable-precise-memory-info --disable-popup-blocking --disable-default-apps --incognito
             --disable-extensions --disable-gpu --disable-setuid-sandbox
             --disable-infobars --disable-web-security --enable-logging=stdout --v=1]
  flags.each { |o| options.add_argument(o) }
  opts.each { |o| options.add_argument(o) }
  options
end

client = Selenium::WebDriver::Remote::Http::Default.new
client.read_timeout = 120

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: [chrome_options], http_client: client)
end

Capybara.default_driver    = :rack_test
Capybara.javascript_driver = :chrome