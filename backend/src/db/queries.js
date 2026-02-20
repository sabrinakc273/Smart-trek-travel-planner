const queries = {
  destinations: {
    getAll: `
      SELECT
        d.id,
        d.name,
        d.region,
        d.description,
        d.difficulty,
        d.min_duration,
        d.max_duration,
        d.elevation,
        d.trip_type,
        d.image_url,
        d.highlights,
        ARRAY_AGG(DISTINCT s.season) FILTER (WHERE s.season IS NOT NULL) as best_seasons
      FROM destinations d
      LEFT JOIN destination_seasons s ON d.id = s.destination_id
      WHERE d.is_active = true
      GROUP BY d.id
      ORDER BY d.name
    `,

    getById: `
      SELECT
        d.id,
        d.name,
        d.region,
        d.description,
        d.difficulty,
        d.min_duration,
        d.max_duration,
        d.elevation,
        d.trip_type,
        d.image_url,
        d.highlights,
        ARRAY_AGG(DISTINCT s.season) FILTER (WHERE s.season IS NOT NULL) as best_seasons
      FROM destinations d
      LEFT JOIN destination_seasons s ON d.id = s.destination_id
      WHERE d.id = $1 AND d.is_active = true
      GROUP BY d.id
    `,

    getFiltered: `
      SELECT
        d.id,
        d.name,
        d.region,
        d.description,
        d.difficulty,
        d.min_duration,
        d.max_duration,
        d.elevation,
        d.trip_type,
        d.image_url,
        d.highlights,
        ARRAY_AGG(DISTINCT s2.season) FILTER (WHERE s2.season IS NOT NULL) as best_seasons
      FROM destinations d
      LEFT JOIN destination_seasons s ON d.id = s.destination_id AND s.season = $3
      LEFT JOIN destination_seasons s2 ON d.id = s2.destination_id
      WHERE d.is_active = true
        AND ($1::text IS NULL OR d.difficulty = $1)
        AND ($2::text IS NULL OR d.trip_type = $2)
        AND ($3::text IS NULL OR s.season IS NOT NULL)
        AND ($4::integer IS NULL OR d.min_duration <= $4)
      GROUP BY d.id
      ORDER BY d.name
    `,

    search: `
      SELECT
        d.id,
        d.name,
        d.region,
        d.description,
        d.difficulty,
        d.min_duration,
        d.max_duration,
        d.elevation,
        d.trip_type,
        d.image_url,
        d.highlights
      FROM destinations d
      WHERE d.is_active = true
        AND (
          LOWER(d.name) LIKE LOWER($1) OR
          LOWER(d.region) LIKE LOWER($1) OR
          LOWER(d.description) LIKE LOWER($1)
        )
      ORDER BY d.name
      LIMIT 10
    `,
  },

  costs: {
    getByDestination: `
      SELECT
        destination_id,
        season,
        accommodation_type,
        group_size_category,
        transportation_cost,
        accommodation_cost_per_day,
        food_cost_per_day,
        permit_cost,
        guide_cost_per_day,
        equipment_cost,
        miscellaneous_cost
      FROM costs
      WHERE destination_id = $1
        AND season = $2
        AND group_size_category = $3
        AND accommodation_type = $4
        AND nationality = $5
    `,

    getDefaultCost: `
      SELECT
        destination_id,
        season,
        accommodation_type,
        group_size_category,
        transportation_cost,
        accommodation_cost_per_day,
        food_cost_per_day,
        permit_cost,
        guide_cost_per_day,
        equipment_cost,
        miscellaneous_cost
      FROM costs
      WHERE destination_id = $1
        AND nationality = $3
      ORDER BY
        CASE WHEN season = $2 THEN 1 ELSE 2 END,
        CASE WHEN accommodation_type = 'standard' THEN 1 ELSE 2 END
      LIMIT 1
    `,
  },

  itineraries: {
    getByDestination: `
      SELECT
        id,
        destination_id,
        day_number,
        title,
        location,
        activities,
        accommodation,
        meals,
        distance,
        elevation,
        duration,
        highlights
      FROM itinerary_templates
      WHERE destination_id = $1
      ORDER BY day_number
    `,
  },

  seasons: {
    getByDestination: `
      SELECT
        season,
        suitability_score,
        weather_notes,
        crowd_level
      FROM destination_seasons
      WHERE destination_id = $1
      ORDER BY suitability_score DESC
    `,
  },

  analytics: {
    recordPlanGeneration: `
      INSERT INTO plan_analytics (
        destination_id,
        season,
        difficulty,
        budget,
        duration,
        group_size,
        nationality,
        total_cost,
        match_score,
        created_at
      )
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, NOW())
    `,
  },
};

export default queries;
