module Spree
  class SuffrageConfiguration < Preferences::Configuration
    preference :admin_polls_per_page, :integer, :default => 10
  end
end
