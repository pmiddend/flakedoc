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
	FLAKE_INKSCAPE_IMAGES
	images/pressure_boundary.eps)

set(
	FLAKE_INKSCAPE_IMAGES_TEX
	images/pressure_boundary.eps_tex)

set(
	FLAKE_IMAGES
	images/advection_clamping_borders.eps
	images/particle_system.pdf
	images/vectorfield.eps
	images/scalarfield.eps
	images/boundary_with_normals.png
	images/boundary_field_for_pressure.eps
	images/boundary_types.eps
	images/simulation_blowup.eps
	images/swimmer_in_water.png
	images/schloss_grey.png
	images/flat_3d_texture.png
	images/schloss_grey_laplace.png
	images/stam_loop.eps
	images/incompressibility_condition_example.eps
	images/stam_loop_with_projection.eps
	images/particle_system_wall_collision.eps
	images/vector_field_rotation.png
	images/thermal_imaging.jpg
	images/vector_field_rotation_arrows.png
	images/advection_bad.eps
	images/scalar_field_to_show_gradient.eps
	images/gradient_of_scalar_field.eps
	images/advection_good.eps
	images/advection_bad_example.eps
	${FLAKE_INKSCAPE_IMAGES})

set(
	FLAKE_BIBFILES
	mendeley_bibliography.bib
	other_sources.bib)

set(
	FLAKE_ADDITIONAL_INPUTS
	navier_stokes.tex
	introduction.tex
	preamble.tex
	mathematics.tex
	stam.tex
	implementation.tex
	${FLAKE_INKSCAPE_IMAGES_TEX})

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
