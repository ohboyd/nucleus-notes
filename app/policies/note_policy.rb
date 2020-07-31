class NotePolicy < ApplicationPolicy
  def show?
    @record.user == user
  end

  def create?
    show?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

  def complete?
    show?
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
