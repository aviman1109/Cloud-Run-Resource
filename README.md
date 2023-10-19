# GitLab Status Resource Type

Similar to [github-status-resource]<https://github.com/dpb587/github-status-resource>

References to GitLab pipeline API

- [Commits API](https://docs.gitlab.com/ee/api/commits.html)
- [Pipelines API](https://docs.gitlab.com/ee/api/pipelines.html)
- [Jobs API](https://docs.gitlab.com/ee/api/jobs.html)

## Behavior

### `check`

Triggers when the status of the branch for the configured context has been updated.

### `in`

Lookup the state of a status.

- `/commit` - the commit reference of the status
- `/description` - a short description of the status
- `/state` - the state of the status
- `/target_url` - the target URL associated with the status
- `/updated_at` - when the status was last updated

### `out`

Update the status of a commit. Optionally include a description and target URL which will be referenced from GitHub.

Parameters:

- **`commit`** - specific commit sha affiliated with the status. Value must be either: path to an input git directory whose detached `HEAD` will be used; or path to an input file whose contents is the sha
- **`state`** - the state of the status. Must be one of `pending`, `success`, `error`, or `failure`
- `description` - a short description of the status
- `target_url` - the target URL to associate with the status (default: concourse build link)
