#!/usr/bin/ruby
require "gtk3"

win = Gtk::Window.new
win.set_title("LinkButton Example")
win.set_border_width(10)

button = Gtk::LinkButton.new("http://www.gtk.org", "Visit GTK+ Homepage")
win.add(button)

win.signal_connect("destroy"){Gtk.main_quit}
win.show_all
Gtk.main 
