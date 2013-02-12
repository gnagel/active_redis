module ActiveRedis
  ####################
  # Class methods
  ####################
  module ClassMethods
    def active_redis; @active_redis ||= ActiveRedis.active_redis_for(self); end
  end
  
  def self.included(base); base.extend(ClassMethods); end

  
  ####################
  # Instance methods
  ####################
  def active_redis; self.class.active_redis; end

  
  def self.active_redis_for(klass)
    Redis::Namespace.new(klass.name.to_sym, @redis)
  end
  

  ####################
  # Bootstrap the ActiveRedis instance
  ####################
  def self.bootstrap_redis!(redis_or_config || {})
    case redis_or_config
    when Redis
      @redis = redis_or_config
    when Hash
      opts = {
        :host => redis_or_config[:host],
        :port => redis_or_config[:port],
      }
      @redis = Redis.new(opts)
    when String
      opts = {
        :host => redis_or_config.split(':').first,
        :port => redis_or_config.split(':').last,
      }
      @redis = Redis.new(opts)
    else
      raise "Unable to connect to redis with: #{redis_or_config}"
    end
    
    nil # Return nil
  end

end