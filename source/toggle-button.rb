#!/usr/bin/ruby
require "gtk3"

def on_button_toggled(button, name)
  if button.active?
    state = "on"
  else
    state = "off"
  end
  puts "Button" + name + " was turned" + state
end

win = Gtk::Window.new
win.set_title("ToggleButton Demo")
win.set_border_width(10)

hbox = Gtk::Box.new(:horizontal, 6)
win.add(hbox)

button = Gtk::ToggleButton.new("Button 1")
button.signal_connect("toggled") {|button| on_button_toggled(button, "1")}
hbox.pack_start(button, :expand => true, :fill => true, :padding => 0)

button = Gtk::ToggleButton.new("B_utton 2", :use_underline => true)
button.set_active(true)
button.signal_connect("toggled") {|button| on_button_toggled(button, "2")}
hbox.pack_start(button, :expand => true, :fill => true, :padding => 0)

win.signal_connect("destroy"){Gtk.main_quit}
win.show_all
Gtk.main 
