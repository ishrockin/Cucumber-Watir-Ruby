<<<<<<< HEAD
require 'watir'
#require "watir-webdriver/extensions/alerts"
require 'selenium-webdriver'
#require 'minitest/autorun'
#require 'watir-webdriver-performance'

if ENV['HEADLESS']
  require 'headless'
  headless = Headless.new
  headless.start
  at_exit do
    headless.destroy
  end
end


# module Watir
#     class ElementLocator
#         alias :old_normalize_selector :normalize_selector
#
#         def normalize_selector(how, what)
#             case how
#                 when :'ng-model'
#                     [how, what]
#                 else
#                     old_normalize_selector(how, what)
#             end
#         end
#     end
# end

#World(MiniTest::Assertions)
=======
>>>>>>> 21d218244e56f91f0317e524dda458268c2fa125
