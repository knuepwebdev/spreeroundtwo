Deface::Override.new(
	:virtual_path => 'spree/layouts/spree_application',
	:remove => "erb[loud]:contains('spree/shared/sidebar')",
	:name => 'remove_sidebar'
)