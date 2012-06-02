cmake_minimum_required(
	VERSION
	2.8)

# Zweites Argument gibt die Language an
project(
	flake
	NONE)

include(
	UseLATEX.cmake)

set(
	FLAKE_IMAGES
	images/particle_system.pdf
	images/vectorfield.eps
	images/scalarfield.eps
	images/simulation_blowup.eps
	images/swimmer_in_water.png
	images/schloss_grey.png
	images/schloss_grey_laplace.png
	images/stam_loop.eps
	images/stam_loop_with_projection.eps
	images/particle_system_wall_collision.eps
	images/vector_field_rotation.png
	images/vector_field_rotation_arrows.png)

set(
	FLAKE_BIBFILES
	mendeley_bibliography.bib)

set(
	FLAKE_ADDITIONAL_INPUTS
	navier_stokes.tex
	mathematics.tex
	stam.tex)

set(
	LATEX_COMPILER_FLAGS
	"-file-line-error")

ADD_LATEX_DOCUMENT(
	main.tex
	INPUTS
	${FLAKE_ADDITIONAL_INPUTS}
	IMAGES
	${FLAKE_IMAGES}
	BIBFILES
	${FLAKE_BIBFILES}
	DEFAULT_SAFEPDF)
