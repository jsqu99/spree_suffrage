Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "suffrage_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:polls, :icon => 'icon-question-sign') %>")
