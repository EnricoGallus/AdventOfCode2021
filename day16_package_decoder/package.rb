class Package
  attr_accessor :version, :type, :literal, :length, :sub_count, :sub_packages

  def initialize(version, type)
    @version = version
    @type = type
  end
end
