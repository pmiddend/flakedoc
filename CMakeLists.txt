cmake_minimum_required(
	VERSION
	2.8)

# Zweites Argument gibt die Language an
project(
	flake
	NONE)

include(
	UseLATEX)

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
	images/boundary_with_normals.eps
	images/single_snow_crystal.png
	images/drag_forces.eps
	images/advection_bad.eps
	images/snow_double_cone.eps
	images/jacobi_times.eps
	images/force_free_slip.eps
	images/point_in_polygon.png
	images/lamp_discrete.png
	images/lamp_obj.jpg
	images/memory_model.png
	images/real_snowflakes.png
	images/graphics_pipeline.eps
	images/triplanar_mountain.png
	images/noise_texture_artifact.png
	images/producer_consumer.eps
	images/ndinterpolation.png
	images/von_neumann.jpg
	images/boundary_field_for_pressure.eps
	images/snow_cover_textures.png
	images/snow_cover_textures_principle.eps
	images/marching_cubes_combinations.svg
	images/shading_comparison.png
	images/perlin_noise_snow.png
	images/execution_model.png
	images/gflops_cpu_vs_gpu.png
	images/gbs_cpu_vs_gpu.png
	images/right_neighborhood.eps
	images/point_sprite_vs_billboard.png
	images/aagaard_layer_model.png
	images/aagaard_spheres.eps
	images/moist_air.eps
	images/boundary_types.eps
	images/simulation_blowup.eps
	images/swimmer_in_water.eps
	images/schloss_grey.png
	images/flat_texture.eps
	images/particle_cylinder.eps
	images/schloss_grey_laplace.png
	images/stam_loop.eps
	images/snowflake_spiral.eps
	images/vortex_shedding.eps
	images/vortex_shedding_macroscopic.png
	images/incompressibility_condition_example.eps
	images/stam_loop_with_projection.eps
	images/opencl_platform_model.eps
	images/opencl_memory_model.eps
	images/particle_system_wall_collision.eps
	images/vector_field_rotation.png
	images/thermal_imaging.png
	images/vector_field_rotation_arrows.png
	images/snowflake_size_graph.eps
	images/snowflake_three_rectangles.eps
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
	preamble.tex
	introduction.tex
	mathematics.tex
	navier_stokes.tex
	stam.tex
	opencl.tex
	opengl.tex
	implementation_wind.tex
	implementation_snowflake.tex
	implementation_boundaries.tex
	implementation_fallen_snow.tex
	${FLAKE_INKSCAPE_IMAGES_TEX})

#set(
#	LATEX_COMPILER_FLAGS
#	"${LATEX_COMPILER_FLAGS} -file-line-error -shell-escape")

ADD_LATEX_DOCUMENT(
	main.tex
	INPUTS
	${FLAKE_ADDITIONAL_INPUTS}
	IMAGES
	${FLAKE_IMAGES}
	BIBFILES
	${FLAKE_BIBFILES}
	DEFAULT_SAFEPDF)
