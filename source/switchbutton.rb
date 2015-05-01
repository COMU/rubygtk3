#!/usr/bin/ruby
require "gtk3"

def on_switch_activated(switch)
  if switch.active?
    state = "on"
  else
    state = "off"
  end
  puts "Switch was turned " + state
end

win = Gtk::Window.new
win.set_title("SwitchButton Example")
win.set_border_width(10)

hbox = Gtk::Box.new(:horizontal, 6)
win.add(hbox)

switch = Gtk::Switch.new
switch.signal_connect("notify::active"){|switch| on_switch_activated(switch)}
switch.set_active(true)
hbox.pack_start(switch, :expand => true, :fill => true, :padding => 0)


win.signal_connect("destroy"){Gtk.main_quit}
win.show_all
Gtk.main 
