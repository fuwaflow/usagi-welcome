/* application.vala
 *
 * Copyright 2026 Unknown
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

public class Welcome.Application : Adw.Application {
    public Application () {
        Object (
            application_id: "page.fuwa.welcome",
            flags: ApplicationFlags.DEFAULT_FLAGS,
            resource_base_path: "/page/fuwa/welcome"
        );
    }

    construct {
        ActionEntry[] action_entries = {
            { "about", this.on_about_action },
            { "preferences", this.on_preferences_action },
            { "quit", this.quit }
        };
        this.add_action_entries (action_entries, this);
        this.set_accels_for_action ("app.quit", {"<control>q"});
    }

    public override void activate () {
        base.activate ();
        var win = this.active_window ?? new Welcome.Window (this);
        win.present ();
    }

    private void on_about_action () {
        string[] authors = { "Unknown" };
        Gtk.show_about_dialog (
            this.active_window,
           "program-name", "Welcome",
           "logo-icon-name", "page.fuwa.welcome",
           "authors", authors,
           "translator-credits", _("translator-credits"),
           "version", "0.1.0",
           "copyright", "© 2026 Unknown"
       );
    }

    private void on_preferences_action () {
        message ("app.preferences action activated");
    }
}
