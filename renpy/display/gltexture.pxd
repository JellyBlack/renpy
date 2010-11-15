cimport renpy.display.render as render

cdef class TextureCore:
    cdef public int width
    cdef public int height
    cdef public int generation
    cdef public unsigned int number
    cdef int format
    cdef double xmul
    cdef double xadd
    cdef double ymul
    cdef double yadd
    cdef object premult
    cdef tuple premult_size
    cdef int premult_left
    cdef int premult_right
    cdef int premult_top
    cdef int premult_bottom
    cdef bint nearest
    cdef list free_list

    cdef void make_ready(TextureCore)
    cdef void make_nearest(TextureCore)
    cdef void make_linear(TextureCore)
    cpdef int allocate(TextureCore)

cdef class TextureGrid:

   cdef public int width
   cdef public int height
   cdef list rows
   cdef list columns
   cdef list tiles # list of lists.
   cdef public TextureGrid half_cache

   cdef void make_ready(self, bint nearest)
   
cpdef blit(
    TextureGrid tg,
    double sx,
    double sy,
    render.Matrix2D transform,
    double alpha,
    environ,
    bint nearest)

cpdef blend(
    TextureGrid tg0,
    TextureGrid tg1,
    double sx,
    double sy,
    render.Matrix2D transform,
    double alpha,
    double fraction,
    environ)

cpdef imageblend(
    TextureGrid tg0,
    TextureGrid tg1,
    TextureGrid tg2,
    double sx,
    double sy,
    render.Matrix2D transform,
    double alpha,
    double fraction,
    int ramp,
    environ)
