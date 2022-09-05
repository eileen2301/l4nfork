module Operations::Admin::Tournament::Phase
  class Load < RailsOps::Operation::Model::Load
    schema3 do
      int! :id, cast_str: true
    end

    model ::Tournament::Phase

    def min_swiss_rounds
      TournamentSystem::Algorithm::Swiss.minimum_rounds(model.seedable_teams.count)
    end
  end
end
