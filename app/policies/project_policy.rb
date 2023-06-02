# frozen_string_literal: true

class ProjectPolicy
    attr_reader :current_user, :model
  
    def initialize(current_user, model)
      @current_user = current_user
      @user = model
    end
  
    def index?
    #   @current_user.admin?
      @current_user.user?
    end
  
    def show?
      @current_user.admin? || @current_user == @user
    end
  
    # def create?
    #   false
    # end
  
    # def new?
    #   create?
    # end
  
    def update?
      @current_user.admin?
    end
  
    # def edit?
    #   update?
    # end
  
    def destroy?
      return false if @current_user == @user
      @current_user.admin?
    end
  
    # class Scope
    #   def initialize(user, scope)
    #     @user = user
    #     @scope = scope
    #   end
  
    #   def resolve
    #     raise NotImplementedError, "You must define #resolve in #{self.class}"
    #   end
  
    #   private
  
    #   attr_reader :user, :scope
    # end
  end
  