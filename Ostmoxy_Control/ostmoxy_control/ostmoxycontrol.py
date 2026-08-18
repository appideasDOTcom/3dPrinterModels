# -*- coding: utf-8 -*-
from __future__ import absolute_import, unicode_literals

import octoprint.plugin

class OstmoxyControlPlugin( octoprint.plugin.StartupPlugin ):
    def on_after_startup( self ):
        self._logger.info( "Hello ostmoxy!" )

__plugin_name__ = "ostmoxy control"
__plugin_version__ = "0.0.1"
__plugin_description__ = "Facilitates communication between OctoPrint, a Raspberry Pi and ostmoxy hardware to improve the printerX User Experience"
__plugin_pythoncompat__ = ">=2.7,<4"
__plugin_implementation__ = OstmoxyControlPlugin()