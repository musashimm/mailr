class Prefs < ActiveRecord::Base

	validates_presence_of :theme,:locale

	has_one :user

	protected

	def self.create_default(user)
		Prefs.create(:user_id => user.id,
					 :theme => $defaults['theme'],
					 :locale => $defaults['locale'],
					 :msgs_per_page => $defaults['msgs_per_page'],
					 :msg_send_type => $defaults['msg_send_type'],
					 :msg_image_view_as => 'attachment',
					 :msg_image_thumbnail_size => '192x144'
					 )
	end
end

# TODO move refresh to prefs and make refresh page with messages
