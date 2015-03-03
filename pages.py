from webapp2 import RequestHandler
import json, time, logging
import db
from datetime import datetime

def datetime_default(obj):
    if isinstance(obj, datetime):
      return obj.strftime("%d/%m/%y")
    
class DefaultHandler(RequestHandler):
  def get(self):
    pageTpl = env.get_template(self.tpl)
    self.response.write(pageTpl.render())

class MainHandler(DefaultHandler):
  tpl = 'index.tpl'

class AddHandler(DefaultHandler):
  tpl = 'add.tpl'

class UpdateHandler(DefaultHandler):
  tpl = 'update.tpl'
  find = {'systems':db.Punch.getSystems, 'tags':db.Punch.getTags}
  def get(self, field=None):
    if field is None:
      DefaultHandler.get(self)
      return
    data = {}
    pageTpl = env.get_template("update/ids.tpl")
    data['ids'] = self.find[field]()
    data['field'] = field[:-1]
    html = pageTpl.render(data);
    self.response.write(html)

class PunchService(RequestHandler):
  def put(self):
    data = json.loads(self.request.body)
    punch = db.Punch.save(data)
    json.dump(punch.to_dict(), self.response, default=datetime_default)

  def get(self):
    punches = db.Punch.query()
    json.dump([punch.to_dict() for punch in punches], self.response, default=datetime_default)    
    


