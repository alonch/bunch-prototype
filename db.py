from google.appengine.ext import ndb

class Punch(ndb.Model):
  id = ndb.IntegerProperty()
  system = ndb.IntegerProperty()
  tag = ndb.IntegerProperty()
  category = ndb.StringProperty()
  status = ndb.BooleanProperty()
  description = ndb.StringProperty()
  attendance = ndb.StringProperty()
  responsible = ndb.StringProperty()
  created = ndb.DateTimeProperty(auto_now_add=True)
  modified = ndb.DateTimeProperty(auto_now=True)

  @staticmethod
  def getNextId():
    return Punch.query().count() + 1

  @staticmethod
  def save(data):
    self = Punch()
    self.populate(**data)
    self.id = Punch.getNextId()
    self.put()
    return self

