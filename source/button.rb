#!/usr/bin/ruby
require "gtk3"

win = Gtk::Window.new
win.set_title("Button Demo")
win.set_border_width(10)

hbox = Gtk::Box.new(:horizontal, 6)
win.add(hbox)

button = Gtk::Button.new(:label => "Click Me")
button.signal_connect("clicked") {puts "\"Click Me\" button was clicked"}
hbox.pack_start(button, :expand => true, :fill => true, :padding => 0)

button = Gtk::Button.new(:stock_id => Gtk::Stock::OPEN)
button.signal_connect("clicked") {puts "\"Open\" button was clicked"}
hbox.pack_start(button, :expand => true, :fill => true, :padding => 0)

button = Gtk::Button.new(:label => "_Close", :mnemonic => true)
button.signal_connect("clicked") {puts "Closing application"; Gtk.main_quit;}
hbox.pack_start(button, :expand => true, :fill => true, :padding => 0)

win.signal_connect("destroy"){Gtk.main_quit}
win.show_all
Gtk.main 
