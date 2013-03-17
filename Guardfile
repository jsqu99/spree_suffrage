# no idea what all thise means.  copied it
guard 'rspec', :cli => '--color --format Fuubar --drb', :all_on_start => false, :all_after_pass => false do
  watch('spec/spec_helper.rb')                        { "spec" }
  watch('config/routes.rb')                           { "spec/requests" }
  watch('app/controllers/application_controller.rb')  { "spec/requests" }
  watch(%r{^app/(.+)\.erb$})                          { |m| "spec/requests/*_spec.rb" }
  watch(%r{^spec/(.+)_spec\.rb$})                     { |m| "spec/#{m[1]}_spec.rb"}
  watch(%r{^app/(.+)_decorator\.rb$})                 { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/spree/(.+)_(controller)\.rb$})  { "spec/requests" }
  watch(%r{^app/controllers/spree/admin/(.+)_(controller)\.rb$})  { "spec/requests/admin" }
end