Red [
	author: "Arnold van Hofwegen"
	title: "Create a background picture"
	filename: %back-react.red
	date: "26-01-2017"
	needs: 'View
]

; declare some variables
picture-size: 640x360
background-color: black
round-edge: 9
block-size: 50x50
space-vert: 5
space-hor: 5
darkness-shadow: -30
tilt1: tilt2: tilt3: tilt4: 0
block-color-1: 0.0.255
block-color-2: 255.150.10
block-color-3: 128.0.128
block-color-4: 255.0.0
draw-blk: copy []
draw-blk-final-img: copy []
hd-image: make image! [1920x1080 0.0.0.255]

set-draw-blk: func [ 
	/local start
][
	start: 0x0
	start: picture-size / 2
	start/1: start/1 - (2 * block-size/1) - (3 * space-hor)
	start/2: start/2 - block-size/2 - space-vert
	b1-pos: start
	rel-shadow: as-pair 0 block-size/2 + (2 * space-vert)
	b1s-pos: b1-pos + rel-shadow
	linear-fill: as-pair block-size/2 + start/2 + (2 * space-vert) 0 
	rel-next: as-pair block-size/2 + (2 * space-hor) 0
	b2-pos: b1-pos + rel-next
	b2s-pos: b2-pos + rel-shadow
	b3-pos: b2-pos + rel-next
	b3s-pos: b3-pos + rel-shadow
	b4-pos: b3-pos + rel-next
	b4s-pos: b4-pos + rel-shadow
	draw-blk: reduce [
		'pen background-color
		'fill-pen block-color-1 'rotate tilt1
		'box b1-pos b1-pos + block-size round-edge
		'fill-pen 'linear linear-fill darkness-shadow block-size/2 90 block-color-1 background-color
		'box b1s-pos b1s-pos + block-size round-edge
		'fill-pen block-color-2 'rotate tilt2
		'box b2-pos b2-pos + block-size round-edge
		'fill-pen 'linear linear-fill darkness-shadow block-size/2 90 block-color-2 background-color 
		'box b2s-pos b2s-pos + block-size round-edge
		'fill-pen block-color-3 'rotate tilt3
		'box b3-pos b3-pos + block-size round-edge
		'fill-pen 'linear linear-fill darkness-shadow block-size/2 90 block-color-3 background-color 
		'box b3s-pos b3s-pos + block-size round-edge
		'fill-pen block-color-4 'rotate tilt4
		'box b4-pos b4-pos + block-size round-edge
		'fill-pen 'linear linear-fill darkness-shadow block-size/2 90 block-color-4 background-color 
		'box b4s-pos b4s-pos + block-size round-edge
	] 
	;print form draw-blk
]

create-draw-blk-final-img: func [
	"Create the SAME image as in draw-blk but not in the desired size"
	/local start
		fi-block-size
		fi-space-hor
		fi-space-vert
		fi-round-edge
		fi-darkness-shadow
][
	fi-block-size: block-size * 3
	fi-space-hor: space-hor * 3
	fi-space-vert: space-vert * 3
	fi-round-edge: round-edge * 3
	fi-darkness-shadow: darkness-shadow * 3
	start: 0x0
	start: 1920x1080 / 2
	start/1: start/1 - (2 * fi-block-size/1) - (3 * fi-space-hor)
	start/2: start/2 - fi-block-size/2 - fi-space-vert
	b1-pos: start
	rel-shadow: as-pair 0 fi-block-size/2 + (2 * fi-space-vert)
	b1s-pos: b1-pos + rel-shadow
	linear-fill: as-pair fi-block-size/2 + start/2 + (2 * fi-space-vert) 0 
	rel-next: as-pair fi-block-size/2 + (2 * fi-space-hor) 0
	b2-pos: b1-pos + rel-next
	b2s-pos: b2-pos + rel-shadow
	b3-pos: b2-pos + rel-next
	b3s-pos: b3-pos + rel-shadow
	b4-pos: b3-pos + rel-next
	b4s-pos: b4-pos + rel-shadow
	draw-blk-final-img: reduce [
		'pen background-color
		'fill-pen background-color
		'box 0x0 1920x1080
		'fill-pen block-color-1 'rotate tilt1
		'box b1-pos b1-pos + fi-block-size fi-round-edge
		'fill-pen 'linear linear-fill fi-darkness-shadow fi-block-size/2 90 block-color-1 background-color
		'box b1s-pos b1s-pos + fi-block-size fi-round-edge
		'fill-pen block-color-2 'rotate tilt2
		'box b2-pos b2-pos + fi-block-size fi-round-edge
		'fill-pen 'linear linear-fill fi-darkness-shadow fi-block-size/2 90 block-color-2 background-color 
		'box b2s-pos b2s-pos + fi-block-size fi-round-edge
		'fill-pen block-color-3 'rotate tilt3
		'box b3-pos b3-pos + fi-block-size fi-round-edge
		'fill-pen 'linear linear-fill fi-darkness-shadow fi-block-size/2 90 block-color-3 background-color 
		'box b3s-pos b3s-pos + fi-block-size fi-round-edge
		'fill-pen block-color-4 'rotate tilt4
		'box b4-pos b4-pos + fi-block-size fi-round-edge
		'fill-pen 'linear linear-fill fi-darkness-shadow fi-block-size/2 90 block-color-4 background-color 
		'box b4s-pos b4s-pos + fi-block-size fi-round-edge
	] 
;	print "draw-block"
;	print form draw-blk
;	print "draw-block-hd"
;	print form draw-blk-final-img
]

main: layout [
	title "Blocks on the Background, by Arnold"
	below
	text "Background"
	bgr: slider 0%
	bgg: slider 0%
	bgb: slider 0%
	text "Round edge"
	re:  slider 1%
	text "Block size"
	bs:  slider 25%
	text "Spacing hor"
	sh:  slider 25%
	text "Spacing vert"
	sv:  slider 50%
	text "Darker shadow"
	ds:  slider 50%
	text "Tilt Blocks"
	t1:  slider 50%
	t2:  slider 50%
	t3:  slider 50%
	t4:  slider 50%
	return
	b: base black 640x360 draw draw-blk
	react [
		b/color/1: to integer! bgr/data * 255
		b/color/2: to integer! bgg/data * 255
		b/color/3: to integer! bgb/data * 255
		background-color: b/color
		block-size: as-pair to integer! bs/data * 400 to integer! bs/data * 400
		space-vert: to integer! sv/data * 10
		space-hor:  to integer! sh/data * 20
		round-edge: to integer! re/data * 50				; = 100 / 2
		if 0 = round-edge [round-edge: 1]
		darkness-shadow: negate to integer! ds/data * 50
		tilt1: -10 + to integer! t1/data * 20
		tilt2: -10 + to integer! t2/data * 20
		tilt3: -10 + to integer! t3/data * 20
		tilt4: -10 + to integer! t4/data * 20
		block-color-1/1: to integer! cb1r/data * 255
		block-color-1/2: to integer! cb1g/data * 255
		block-color-1/3: to integer! cb1b/data * 255
		block-color-2/1: to integer! cb2r/data * 255
		block-color-2/2: to integer! cb2g/data * 255
		block-color-2/3: to integer! cb2b/data * 255
		block-color-3/1: to integer! cb3r/data * 255
		block-color-3/2: to integer! cb3g/data * 255
		block-color-3/3: to integer! cb3b/data * 255
		block-color-4/1: to integer! cb4r/data * 255
		block-color-4/2: to integer! cb4g/data * 255
		block-color-4/3: to integer! cb4b/data * 255
		set-draw-blk  
		b/draw: draw-blk
	]
;	invisible-image: base black 0x0 draw draw-blk-final-img do [invisible-image/visible?: false]
	return
	text "Color Block 1" 
	cb1r: slider 0% cb1g: slider 100% cb1b: slider 100%
	;button [print rejoin ["Block 1 red " cb1r/data " green " cb1g/data " blue " cb1b/data]]
	text "Color Block 2" 
	cb2r: slider 100% cb2g: slider 60% cb2b: slider 4%
	;button [print rejoin ["Block 2 red " cb2r/data " green " cb2g/data " blue " cb2b/data]]
	text "Color Block 3" 
	cb3r: slider 50% cb3g: slider 0% cb3b: slider 50%
	;button [print rejoin ["Block 3 red " cb3r/data " green " cb3g/data " blue " cb3b/data]]
	text "Color Block 4" 
	cb4r: slider 100% cb4g: slider 0% cb4b: slider 0%
	;button [print rejoin ["Block 4 red " cb4r/data " green " cb4g/data " blue " cb4b/data]]
;	png-size: drop-down data ["1920x1080" "800x600" "600x400"] do [png-size/selected: 1]
	button "Save as png" [
		save %bg-image.png to-image b
		create-draw-blk-final-img
		save %bg-image-HD.png draw hd-image draw-blk-final-img
	]
]

view main