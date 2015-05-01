#!/usr/bin/ruby
require "gtk3"

def on_button_toggled(button, name)
  if button.active?
    state = "on"
  else
    state = "off"
  end
  puts "Button " + name + " was turned " + state
end

win = Gtk::Window.new
win.set_title("RadioButton Demo")
win.set_border_width(10)

hbox = Gtk::Box.new(:horizontal, 6)
win.add(hbox)

button1 = Gtk::RadioButton.new("Button 1")
button1.signal_connect("toggled") {|button| on_button_toggled(button, "1")}
hbox.pack_start(button1, :expand => false, :fill => false, :padding => 0)

button2 = Gtk::RadioButton.new(button1, "Button 2")
button2.signal_connect("toggled") {|button| on_button_toggled(button, "2")}
hbox.pack_start(button2, :expand => false, :fill => false, :padding => 0)

button3 = Gtk::RadioButton.new(button1, "B_utton 3", true)
button3.signal_connect("toggled") {|button| on_button_toggled(button, "3")}
hbox.pack_start(button3, :expand => false, :fill => false, :padding => 0)

win.signal_connect("destroy"){Gtk.main_quit}
win.show_all
Gtk.main 
