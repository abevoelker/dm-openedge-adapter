# DataMapper adapter for OpenEdge databases

This gem is basically junk, besides providing the `SELECT TOP`
functionality.  All the interesting work goes on in [do_openedge][1].

## Status

This gem needs more tests, cleanup and a `:sequence` option. I'm not going
to do any of that on my own time as I don't deal with OpenEdge anymore.

If you are interested in this gem being finished, contact me as I would
accept a sponsorship to take some time off work to clean it up.

## Testing

    DM_DB_USER=Abe DM_DB_PASSWORD= DM_DB_HOST=192.168.1.243:13370 rake spec

[1]: https://github.com/abevoelker/do/tree/add-openedge-adapter
