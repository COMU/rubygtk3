#!/usr/bin/ruby
require "gtk3"

win = Gtk::Window.new
# set window title
win.set_title("Label Example")
multi_line = %{This is an example of a line-wrapped label.  It
                should not be taking up the entire      
                width allocated to it, but automatically 
                     It supports multiple paragraphs correctly, 
                and  correctly   adds 
                many          extra  spaces. }
hbox = Gtk::Box.new(:horizontal, 10)
hbox.set_homogeneous(false)

vbox_left = Gtk::Box.new(:vertical, 10)
vbox_left.set_homogeneous(false)
vbox_right = Gtk::Box.new(:vertical, 10)
vbox_right.set_homogeneous(false)
hbox.pack_start(vbox_left, :expand => true, :fill => true, :padding => 0)
hbox.pack_start(vbox_right, :expand => true, :fill => true, :padding => 0)

# simple label
label = Gtk::Label.new("This is a normal label")
vbox_left.pack_start(label, :expand => true, :fill => true, :padding => 0)

label = Gtk::Label.new
# seperated lines with \n
label.set_text("This is a left-justified label.\nWith multiple lines.")
# label justified by left
label.set_justify(Gtk::Justification::LEFT)
vbox_left.pack_start(label, :expand => true, :fill => true, :padding => 0)

label = Gtk::Label.new("This is a right-justified label.\nWith multiple lines.")
label.set_justify(Gtk::Justification::RIGHT)
vbox_left.pack_start(label, :expand => true, :fill => true, :padding => 0)

label = Gtk::Label.new(multi_line)
label.wrap = true
label.set_justify(Gtk::Justification::FILL)
vbox_right.pack_start(label, :expand => true, :fill => true, :padding => 0)

label = Gtk::Label.new
# use markup language in label text
label.set_markup("Text can be <small>small</small>, <big>big</big>, 
                  <b>bold</b>, <i>italic</i> and even point to
                  somewhere in the <a href=\"http://www.gtk.org\">Visit Gtk offical page</a>")
label.wrap = true
vbox_left.pack_start(label, :expand => true, :fill => true, :padding => 0)

label = Gtk::Label.new("_Press Alt + P to select button to the right", true)
vbox_left.pack_start(label, :expand => true, :fill => true,:padding => 0)
# enable label selection by true
label.set_selectable(true)
button = Gtk::Button.new(:label => "Click at your own risk")
label.set_mnemonic_widget(button)
vbox_right.pack_start(button, :expand => true, :fill => true, :padding => 0)

win.add(hbox)
win.signal_connect("destroy"){Gtk.main_quit}
win.show_all
Gtk.main
