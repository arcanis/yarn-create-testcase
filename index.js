let { concierge, flags } = require(`@manaflair/concierge`);

concierge

    .command(`create`)
    .flag(flags.DEFAULT_COMMAND)

    .action(() => {
        let fse = require(`fs-extra`);
        fse.copySync(`${__dirname}/statics/`, `${process.cwd()}`);
    });

concierge

    .command(`run <path>`)

    .action(args => {
        let cp = require(`child_process`);
        cp.execSync(`source "${__dirname}/library.sh" && source "${args.path}"`, { shell: `bash`, stdio: `inherit` });
    });

concierge

    .runExit(process.argv0, process.argv.slice(2));
