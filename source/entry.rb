#!/usr/bin/ruby
require "gtk3"
require "glib2"

def on_editable_toggled(button, entry)
  # is check button active?, if so set value by true
  value = button.active?
  # enable editable property of entry
  entry.set_editable(value)
end

def on_visible_toggled(button, entry)
  value = button.active?
  entry.set_editable(value)
end

def on_pulse_toggled(button, entry, timeout_id)
  if (button.active?)
    entry.set_progress_pulse_step(0.2)
    # call do_pulse with specified timeinterval
    timeout_id = GLib::Timeout.add(1000) {do_pulse(entry)}
  else
    # remove timeinterval
    GLib::Source.remove(timeout_id)
    timeout_id = nil
    entry.set_progress_pulse_step(0)
  end
end

def do_pulse(entry)
  entry.progress_pulse
  return true
end

def on_icon_toggled(button, entry)
  if button.active?
   # set icon from stock
    entry.primary_icon_stock = Gtk::Stock::FIND
  else
    entry.primary_icon_stock = ""
  end
  entry.show_all
end

timeout_id = 10
win = Gtk::Window.new
win.set_title("Entry Example")
win.set_size_request(200, 100)

vbox = Gtk::Box.new(:vertical, 6)
win.add(vbox)

entry = Gtk::Entry.new
entry.set_text("Hello World")
vbox.pack_start(entry, :expand => true, :fill => true, :padding => 0)

hbox = Gtk::Box.new(:horizontal, 6)
vbox.pack_start(hbox, :expand => true, :fill => true, :padding => 0)

check_editable = Gtk::CheckButton.new("Editable")
check_editable.signal_connect("toggled") {|button| on_editable_toggled(button, entry)}
check_editable.set_active(true)
hbox.pack_start(check_editable, :expand => true, :fill => true, :padding => 0)

check_visible = Gtk::CheckButton.new("Visible")
check_visible.signal_connect("toggled") {|button| on_visible_toggled(button, entry)}
check_visible.set_active(true)
hbox.pack_start(check_visible, :expand => true, :fill => true, :padding => 0)

pulse = Gtk::CheckButton.new("Pulse")
pulse.signal_connect("toggled") {|button| on_pulse_toggled(button, entry, timeout_id)}
pulse.set_active(false)
hbox.pack_start(pulse, :expand => true, :fill => true, :padding => 0)

icon = Gtk::CheckButton.new("Icon")
icon.signal_connect("toggled") {|button| on_icon_toggled(button, entry)}
icon.set_active(true)
hbox.pack_start(icon, :expand => true, :fill => true, :padding => 0)

win.signal_connect("destroy"){Gtk.main_quit}
win.show_all
Gtk.main
