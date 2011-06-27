# encoding: utf-8
WillPaginate::ViewHelpers.pagination_options[:inner_window] = 2
WillPaginate::ViewHelpers.pagination_options[:previous_label] = "назад"
WillPaginate::ViewHelpers.pagination_options[:next_label] = "вперед"
Sunspot.config.pagination.default_per_page = 10

