--changeset anair:movie_pkg  splitStatements:false runOnChange:true
CREATE OR REPLACE 
PACKAGE MOVIE_PKG IS 

  procedure proc_fetch_actors_in_movie(i_movie_id in number,out_data out sys_refcursor);
  
END;