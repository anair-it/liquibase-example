--changeset anair:movie_pkg_body  splitStatements:false runOnChange:true
CREATE OR REPLACE
PACKAGE BODY MOVIE_PKG AS

  procedure proc_fetch_actors_in_movie(i_movie_id in number,out_data out sys_refcursor) AS
  BEGIN
   open out_data for
    select a.*
    from actor a, movie_actor ma
    where ma.movie_id = i_movie_id
    and ma.actor_id = a.id;
    
  END;

END;