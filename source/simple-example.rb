#!/usr/bin/ruby
require "gtk3"

win = Gtk::Window.new
win.signal_connect("destroy"){ Gtk.main_quit }
win.show_all
Gtk.main 
