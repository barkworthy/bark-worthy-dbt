{{ config(
    materialized='view',
    schema='staging'
) }}

select      trim(internal_uuid) as internal_uuid,
            seeding_id::int,
            lower(trim(platform)) as platform,
            lower(trim(handle)) as handle,
            lower(trim(initiation_direction)) as initiation_direction,
            first_message_date::date,
            trim(product_id_sent) as product_id_sent,
            delivery_date::date,
            first_post_date::date,
            num_static_posts::smallint,
            num_short_form_videos::smallint,
            num_ephemeral::smallint,
            trim(pinned_content)::boolean as pinned_content,
            post_effort_level::smallint,
            support_level::smallint,
            trim(posted_after_initial)::boolean as posted_after_initial,
            trim(sent_raw_footage)::boolean as sent_raw_footage,
            trim(notes) as notes,
            processed_at::timestamp
from        {{ source('google_sheets', 'creator_seedings') }}