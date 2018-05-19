<%def name="ledelement(x,y)">
Element["" "" "" "" ${x}mil ${y}mil 0.0000 0.0000 0 100 ""]
(
	Pin[0.0000 -80.00mil 42.00mil 20.00mil 46.00mil 30.00mil "" "R" "square"]
	Pin[0.0000 -30.00mil 42.00mil 20.00mil 46.00mil 30.00mil "" "+" "square"]
	Pin[0.0000 20.00mil 42.00mil 20.00mil 46.00mil 30.00mil "" "B" "square"]
	Pin[0.0000 70.00mil 42.00mil 20.00mil 46.00mil 30.00mil "" "G" "square"]
	ElementLine [-120.00mil -10.00mil -120.00mil 0.0000 10.00mil]
	ElementLine [120.00mil -10.00mil 120.00mil 0.0000 10.00mil]
	ElementLine [-50.00mil -120.00mil 50.00mil -120.00mil 10.00mil]
	ElementArc [0.0000 0.0000 120.00mil 120.00mil 90 90 10.00mil]
	ElementArc [0.0000 0.0000 120.00mil 120.00mil 0 90 10.00mil]
	ElementArc [0.0000 -10.00mil 120.00mil 120.00mil 180 90 10.00mil]
	ElementArc [0.0000 -10.00mil 120.00mil 120.00mil 270 90 10.00mil]

	)
</%def>
