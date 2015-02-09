# Be sure to make a logs directory or change the filename value in the
# 'file' and 'debugfile' handlers below.
#
LOGDIR='logs'
LOGSETTINGS= {
    'version':  1,
    'root': {
        'level': 'DEBUG',
        'handlers': ['console', 'debugfile', 'file', 'syslog',],
    },
    'handlers': {
        'console': {
            'class': 'logging.StreamHandler',
            'level': 'DEBUG',
            'formatter': 'messages',
        },
        'debugfile': {
            'class': 'logging.FileHandler',
            'level': 'DEBUG',
            'formatter': 'debug',
            'filename': LOGDIR + '/debug.log',
            'mode': 'a',
        },
        'file': {
            'class': 'logging.handlers.RotatingFileHandler',
            'level': 'INFO',
            'formatter': 'standard',
            'filename': LOGDIR + '/application.log',
            'mode': 'a',
            'maxBytes': 1024000,
            'backupCount': 2,
        },
        'syslog': {
            'class': 'logging.handlers.SysLogHandler',
            'level': 'WARN',
            'address': '/dev/log',
            'formatter': 'syslog',
        },
    },

    'formatters': {
        'debug': {
            'format': '%(asctime)s %(module)-18s %(levelname)-8s ' \
                'filename: %(filename)s line:%(lineno)d %(message)s',
        },
        'messages': {
            'format': '%(asctime)s %(module)s[%(process)d]: %(message)s',
            'datefmt': '%b %d %H:%M:%S',
        },
        'standard': {
            'format': '%(asctime)s %(module)-18s %(levelname)-8s %(message)s',
        },
        'syslog' : { 
            'format': '%(module)s[%(process)d]: %(levelname)s %(message)s',
        },
    }
}
