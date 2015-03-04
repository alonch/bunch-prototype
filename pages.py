from webapp2 import RequestHandler
import json, time, logging
import db
from datetime import datetime

def datetime_default(obj):
    if isinstance(obj, datetime):
      return obj.strftime("%d/%m/%y")
    
class DefaultHandler(RequestHandler):
  def get(self):
    self.render()

  def render(self, data={}):
    pageTpl = env.get_template(self.tpl)
    self.response.write(pageTpl.render(data))

class MainHandler(DefaultHandler):
  tpl = 'index.tpl'
  def get(self, page=None):
    data = {}
    data['main'] = page is None
    self.render(data)

class AddHandler(DefaultHandler):
  tpl = 'add.tpl'

class UpdateHandler(DefaultHandler):
  tpl = 'update.tpl'
  find = {'systems':db.Punch.getSystems, 'tags':db.Punch.getTags}
  names ={'systems':['Civil Structural', '480 KV', 'Instrument Air', 'Gas', 'Building', 'Electrical Cables'],
          'tags':['Cables', 'Piping', "Valves", "PT's", 'Instruments']}
  def get(self, field=None):
    if field is None:
      DefaultHandler.get(self)
      return
    data = {}
    pageTpl = env.get_template("update/ids.tpl")
    data['ids'] = self.find[field]()
    data['names'] = self.names[field]
    html = pageTpl.render(data);
    self.response.write(html)

class ReportsHandler(DefaultHandler):
  tpl = 'reports.tpl'

class PunchService(DefaultHandler):
  def put(self):
    data = json.loads(self.request.body)
    punch = db.Punch.save(data)
    json.dump(punch.to_dict(), self.response, default=datetime_default)
    #punch.key.delete()

  def get(self):
    process = {'json':self.getJson, 
              'html':self.getHtml, 
              'delete':self.getDelete}
    output = self.request.get("output", "json")
    process[output]()

  def getJson(self):
    punches = db.Punch.query()
    json.dump([punch.to_dict() for punch in punches], self.response, default=datetime_default)    
  
  def getHtml(self):
    self.tpl = 'report.tpl'
    data = {}
    punches = db.Punch.query()
    data['punches']= json.dumps([punch.to_dict() for punch in punches], default=datetime_default)      
    self.render(data)

  def getDelete(self):
    db.Punch.deleteAll()

  def post(self):
    data = json.loads(self.request.body)
    punch = db.Punch.query(db.Punch.id==data['id']).get()
    punch.status = data['status']
    punch.modifiedBy = data['modifiedBy']
    punch.put()
    #json.dump(punch.to_dict(), self.response, default=datetime_default)
    
  class LoginHandler(DefaultHandler):
    
    def get(self):
      pass

  
