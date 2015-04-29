#!/usr/bin/ruby
require "gtk3"

win = Gtk::Window.new
table = Gtk::Table.new(3, 3, true)
win.set_title("Table Example")

button1 = Gtk::Button.new(:label => "Button 1")
button2 = Gtk::Button.new(:label => "Button 2")
button3 = Gtk::Button.new(:label => "Button 3")
button4 = Gtk::Button.new(:label => "Button 4")
button5 = Gtk::Button.new(:label => "Button 5")
button6 = Gtk::Button.new(:label => "Button 6")

table.attach(button1, 0, 1, 0, 1)
table.attach(button2, 1, 3, 0, 1)
table.attach(button3, 0, 1, 1, 3)
table.attach(button4, 1, 3, 1, 2)
table.attach(button5, 1, 2, 2, 3)
table.attach(button6, 2, 3, 2, 3)

win.add(table)
win.signal_connect("destroy"){Gtk.main_quit}
win.show_all
Gtk.main 
