#!/usr/bin/ruby
require "gtk3"

win = Gtk::Window.new
hbox = Gtk::Box.new(:horizontal, 3)
hello_button = Gtk::Button.new(:label => "Box Example")
goobye_button = Gtk::Button.new(:label => "Goodbye")

win.add(hbox)
hbox.pack_start(hello_button, :expand => true, :fill => false, :padding =>2)
hbox.pack_start(goobye_button, :expand => true, :fill => false, :padding =>2)

# print hello world to terminal
hello_button.signal_connect("clicked") {puts "Hello World"}
goobye_button.signal_connect("clicked") {puts "Goodbye"}

win.signal_connect("destroy"){Gtk.main_quit}
win.show_all
Gtk.main 
