/*
 * Copyright (C) 2009, 2010 Hermann Meyer, James Warden, Andreas Degert
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#include <gtkmm/main.h>
#include <gxw/gxinit.h>
#include <gxwmm/init.h>
#include "wrap_init.h"

namespace Gxw
{

void init()
{
	gxw_init();
	Gtk::Main::init_gtkmm_internals(); //Sets up the g type system and the Glib::wrap() table.
	Gxw::wrap_init(); //Tells the Glib::wrap() table about the libsomethingmm classes.
}

} // namespace Gxw