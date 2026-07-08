/*
 *
 * Copyright (C) 2001-2005 Ichiro Fujinaga, Michael Droettboom, and Karl MacMillan
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#ifndef GAMERACORE_INTERNAL
   #define GAMERACORE_INTERNAL
#endif
#include "gameramodule.hpp"

using namespace Gamera;

/*
  These are prototyped here because this is the only file in which
  they will be used. They are defined in the .cpp files for each of
  the types.
*/
void init_SizeType(PyObject* module_dict);
void init_PointType(PyObject* module_dict);
void init_FloatPointType(PyObject* module_dict);
void init_DimType(PyObject* module_dict);
void init_RectType(PyObject* module_dict);
void init_RegionType(PyObject* module_dict);
void init_RegionMapType(PyObject* module_dict);
void init_RGBPixelType(PyObject* module_dict);
void init_ImageDataType(PyObject* module_dict);
void init_ImageType(PyObject* module_dict);
void init_ImageInfoType(PyObject* module_dict);
void init_ListUtilities(PyObject* module_dict);
void init_IteratorType(PyObject* module_dict);

PyMethodDef gamera_module_methods[] = {
  {nullptr, nullptr },
};

static struct PyModuleDef moduledef = {
        PyModuleDef_HEAD_INIT,
        "gamera.gameracore",
        nullptr,
        -1,
        gamera_module_methods,
        nullptr,
        nullptr,
        nullptr,
        nullptr
};

PyMODINIT_FUNC PyInit_gameracore(void) {
    PyObject *m = PyModule_Create(&moduledef);
    //PyObject* m = Py_InitModule( "gameracore", gamera_module_methods);
    PyObject *d = PyModule_GetDict(m);

#define GAMERA_INIT_TYPE(fn) do { \
    fn(d); \
    if (PyErr_Occurred()) { \
      PySys_WriteStderr("gameracore init failed in %s\n", #fn); \
      Py_XDECREF(m); \
      return nullptr; \
    } \
  } while (0)

    GAMERA_INIT_TYPE(init_SizeType);
    GAMERA_INIT_TYPE(init_PointType);
    GAMERA_INIT_TYPE(init_FloatPointType);
    GAMERA_INIT_TYPE(init_DimType);
    GAMERA_INIT_TYPE(init_RectType);
    GAMERA_INIT_TYPE(init_RegionType);
    GAMERA_INIT_TYPE(init_RegionMapType);
    GAMERA_INIT_TYPE(init_RGBPixelType);
    GAMERA_INIT_TYPE(init_ImageDataType);
    GAMERA_INIT_TYPE(init_ImageType);
    GAMERA_INIT_TYPE(init_ImageInfoType);
    GAMERA_INIT_TYPE(init_IteratorType);

#undef GAMERA_INIT_TYPE

    return m;
}
