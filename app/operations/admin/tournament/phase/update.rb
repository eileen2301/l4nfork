module Operations::Admin::Tournament::Phase
  class Update < RailsOps::Operation::Model::Update
    schema3 do
      int? :id, cast_str: true
      hsh? :tournament_phase do
        str? :name
        str? :tournament_mode
      end
    end

    model ::Tournament::Phase
  end
end
