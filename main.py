import webapp2, jinja2, os
import __builtin__

__builtin__.env = jinja2.Environment(
  loader=jinja2.FileSystemLoader(os.path.dirname(__file__)+"/views"),
  extensions=['jinja2.ext.autoescape'],
  autoescape=False)

import pages

app = webapp2.WSGIApplication([
  ('/(punches)?', pages.MainHandler),
  ('/add', pages.AddHandler),
  ('/rest/punch', pages.PunchService),
  ('/update/?(systems|tags)?', pages.UpdateHandler)
], debug=True)
