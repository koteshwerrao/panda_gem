module Panda
  class Cloud < Base
    include Panda::Router
    include Panda::Updatable
    attr_writer :connection
    
    def initialize(attributes={})
      super(attributes)
      Panda.clouds[id]=self
    end
    
    def videos
      Scope.new(self, Video)
    end
    
    def encodings
      Scope.new(self, Encoding)
    end
    
    def profiles
      Scope.new(self, Profile)
    end
    
    class << self
      def connection
        Panda.connection
      end
    end
    
    def connection
      @connection ||= Connection.new(self.class.connection.to_hash.merge!(:cloud_id => id))
    end
    
  end
end
