from mako.template import Template
from mako.lookup import TemplateLookup

leds = []
spacing = 502
for x in range(8):
	for y in range(8):
		leds.append((x*spacing + 125.0, y*spacing + 125.0))
	pass

open("ledgrid.pcb", "w").write(Template(filename="ledgrid.pcb.mako", lookup=TemplateLookup(directories=['.'])).render(elements=leds))
