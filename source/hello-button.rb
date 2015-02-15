#!/usr/bin/ruby
require "gtk3"

win = Gtk::Window.new
button = Gtk::Button.new(:label => "Hello World")
win.add(button)

# print hello world to terminal
button.signal_connect("clicked") {puts "Hello World"}

win.signal_connect("destroy"){Gtk.main_quit}
win.show_all
Gtk.main 
