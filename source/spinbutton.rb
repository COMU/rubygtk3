#!/usr/bin/ruby
require "gtk3"

def on_numeric_toggled(button, spinbutton)
  spinbutton.set_numeric(button.active?)
end

def on_ifvalid_toggled(button, spinbutton)
  if button.active?
    policy = Gtk::SpinButton::UpdatePolicy::IF_VALID
  else
    policy = Gtk::SpinButton::UpdatePolicy::ALWAYS
  end
  spinbutton.set_update_policy(policy)
end

win = Gtk::Window.new
win.set_title("SpinButton Example")
win.set_border_width(10)

hbox = Gtk::Box.new(:horizontal, 6)
win.add(hbox)

adjustment = Gtk::Adjustment.new(0, 0, 100, 1, 10, 0)
spinbutton = Gtk::SpinButton.new
spinbutton.set_adjustment(adjustment)
hbox.pack_start(spinbutton, :expand => false, :fill => false, :padding => 0)

check_numeric = Gtk::CheckButton.new("Numeric")
check_numeric.signal_connect("toggled") {|button| on_numeric_toggled(button, spinbutton)}
hbox.pack_start(check_numeric, :expand => false, :fill => false, :padding => 0)

check_ifvalid = Gtk::CheckButton.new("If Valid")
check_ifvalid.signal_connect("toggled") {|button| on_ifvalid_toggled(button, spinbutton)}
hbox.pack_start(check_ifvalid, :expand => false, :fill => false, :padding => 0)

win.signal_connect("destroy"){Gtk.main_quit}
win.show_all
Gtk.main 
