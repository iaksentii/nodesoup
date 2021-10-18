import qbs

StaticLibrary {
	name: 'nodesoup'

	Depends { name: 'cpp' }

	cpp.includePaths: [
		'include',
		'src'
	]

	cpp.cxxLanguageVersion: 'c++17'
	cpp.defines: {
		if (qbs.toolchain.contains("msvc"))
			return [ '_USE_MATH_DEFINES' ]
	}

	Export {
		Depends { name: 'cpp' }
		cpp.includePaths: [
			'include',
			'src'
		]
	}

	Group {
		name: 'C++ files'
		prefix: 'src/'
		files: ['**/*.cpp', '**/*.hpp']
	}
}
