// -*- c++ -*-
// Generated by gtkmmproc -- DO NOT MODIFY!
#ifndef _GXWMM_SMALLKNOB_P_H
#define _GXWMM_SMALLKNOB_P_H


#include <gxwmm/private/knob_p.h>

#include <glibmm/class.h>

namespace Gxw
{

class SmallKnob_Class : public Glib::Class
{
public:
#ifndef DOXYGEN_SHOULD_SKIP_THIS
  typedef SmallKnob CppObjectType;
  typedef GxSmallKnob BaseObjectType;
  typedef GxSmallKnobClass BaseClassType;
  typedef Gxw::Knob_Class CppClassParent;
  typedef GxKnobClass BaseClassParent;

  friend class SmallKnob;
#endif /* DOXYGEN_SHOULD_SKIP_THIS */

  const Glib::Class& init();


  static void class_init_function(void* g_class, void* class_data);

  static Glib::ObjectBase* wrap_new(GObject*);

protected:

#ifdef GLIBMM_DEFAULT_SIGNAL_HANDLERS_ENABLED
  //Callbacks (default signal handlers):
  //These will call the *_impl member methods, which will then call the existing default signal callbacks, if any.
  //You could prevent the original default signal handlers being called by overriding the *_impl method.
#endif //GLIBMM_DEFAULT_SIGNAL_HANDLERS_ENABLED

  //Callbacks (virtual functions):
#ifdef GLIBMM_VFUNCS_ENABLED
#endif //GLIBMM_VFUNCS_ENABLED
};


} // namespace Gxw


#endif /* _GXWMM_SMALLKNOB_P_H */

