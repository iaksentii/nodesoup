import qbs

StaticLibrary {
	name: 'nodesoup'

	Depends { name: 'cpp' }

	cpp.includePaths: [
		'include',
		'src'
	]

	cpp.cxxLanguageVersion: 'c++17'

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
